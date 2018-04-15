module UsersHelper
    def full_name
       @user.name + " " + @user.lastname
    end
end
