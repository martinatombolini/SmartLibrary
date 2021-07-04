require 'rails_helper.rb'
describe BooksController, type: :controller do
    fixtures :all
    before(:all) do 
    Book.all.each do |bk|
        bk.destroy
    end
    end
    it "Should give me books from fixtures" do
        get :index
        expect(assigns(:books).size).to eql(1)
    end


    #Libraries
	context "with Library privileges" do
		before :each do
			library = users(:library)
			sign_in library
		end
		#Create
		it "should create books" do
			params = {:book=>{:title => "Title", :author => "Author", :notes => "Notes", :isbn => 1234567890123}}
			get :create, :params => params
			b_tst = Book.where(:title => "Title")
			expect(b_tst).not_to be_empty
		end
		#Retrieve
		it "should retrieve books" do
			bk = books(:one)
			params = {:id => bk.id}
			get :show, :params => params
			expect(assigns(:book)).to eql(bk)
		end

		#Update

		it "should update books" do
			bk = books(:one)
			params = {:id => bk.id, :book=>{:title => "Title"}}
			get :update, :params => params
			b_tst = Book.find(bk.id)
			expect(b_tst.title).not_to eql(bk.title)
		end

		#Delete
		it "should destroy books" do
			bk = books(:one)
			params = {:id => bk.id}
			get :destroy, :params => params
			b_tst = Book.where(:id => bk.id)
			expect(b_tst).to be_empty
		end




	end

    #Reader
	context "with Reader privileges" do
		before :each do
			reader = users(:reader)
			sign_in reader
		end
		#Create
		it "should not create books" do
			params = {:book=>{:title => "Title", :author => "Author", :notes => "Notes", :isbn => 1234567890123}}
			get :create, :params => params
			b_tst = Book.where(:title => "Title")
			expect(b_tst).to be_empty
		end

		#Retrieve
		it "should retrieve books" do
			bk = books(:one)
			params = {:id => bk.id}
			get :show, :params => params
			expect(assigns(:book)).to eql(bk)
		end

		#Update
        it "should not update books" do
			bk = books(:one)
			params = {:id => bk.id, :book=>{:title => "Title"}}
			get :update, :params => params
			b_tst = Book.find(bk.id)
			expect(b_tst.title).to eql(bk.title)
		end

		#Destroy
		it "should not destroy books" do
			bk = books(:one)
			params = {:id => bk.id}
			get :destroy, :params => params
			b_tst = Book.where(:id => bk.id)
			expect(b_tst).not_to be_empty
		end




	end




end