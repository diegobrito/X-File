def create_user(username, role = username)
  User.find_or_create_by_email "#{username}@mailinator.com",
              :username => username,
              :first_name => username.humanize,
              :last_name => "Smith",
              :role => role,
              :password => "123123",
              :password_confirmation => "123123"
end

def doing(text, &block)
  if block_given?
    print "#{text}..."
    yield
    puts "Done!"
  else
    puts text
  end
end

namespace :dev do
  desc "Task description"
  task :load_fake_data => [:environment] do
    doing("Add admin and employee") do
      create_user "admin"
      create_user "employee"
    end
    
    print "Customers"
    20.times {|i| 
      print "."
      u = create_user "customer#{i}", "customer"
      
      (rand(50)+1).times { |n|
        u.documents.create :title => "Document #{i} #{n}", 
                          :description => "Description of document ##{i} #{n}",
                          :file => File.new(Rails.root.join("test/fixtures/ruby_icon_16.png"))
      }
    }
  end  
end

