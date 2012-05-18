# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Directory" do
    describe "Admin" do
      describe "contacts" do
        login_refinery_user

        describe "contacts list" do
          before(:each) do
            FactoryGirl.create(:contact, :name => "UniqueTitleOne")
            FactoryGirl.create(:contact, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.directory_admin_contacts_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.directory_admin_contacts_path

            click_link "Add New Contact"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Directory::Contact.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Directory::Contact.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:contact, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.directory_admin_contacts_path

              click_link "Add New Contact"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Directory::Contact.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:contact, :name => "A name") }

          it "should succeed" do
            visit refinery.directory_admin_contacts_path

            within ".actions" do
              click_link "Edit this contact"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:contact, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.directory_admin_contacts_path

            click_link "Remove this contact forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Directory::Contact.count.should == 0
          end
        end

      end
    end
  end
end
