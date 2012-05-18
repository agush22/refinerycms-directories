# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Directory" do
    describe "Admin" do
      describe "categories" do
        login_refinery_user

        describe "categories list" do
          before(:each) do
            FactoryGirl.create(:category, :title => "UniqueTitleOne")
            FactoryGirl.create(:category, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.directory_admin_categories_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.directory_admin_categories_path

            click_link "Add New Category"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Directory::Category.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Directory::Category.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:category, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.directory_admin_categories_path

              click_link "Add New Category"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Directory::Category.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:category, :title => "A title") }

          it "should succeed" do
            visit refinery.directory_admin_categories_path

            within ".actions" do
              click_link "Edit this category"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:category, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.directory_admin_categories_path

            click_link "Remove this category forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Directory::Category.count.should == 0
          end
        end

      end
    end
  end
end
