# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - the app is based on a Corneal Sinatra MVC template and uses Sinatra methods, views, forms, and .erb format.
- [x] Use ActiveRecord for storing information in a database - creation of tables in the app's database and storing data in those tables has been handled using ActiveRecord Migration.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - there are two different model classes of users who have access to different things within the app - inventors and inspectors; this has been handled by differentiation between those models (current_user) and primary keys of their instances (inventors and inspectors in this case). There are two more model classes - inventions filed by the inventors and categories of those inventions (the official US PTO inventions categories).
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - an inventor has_many inventions, and an invention belongs_to an inventor; more over, an inventor has many categories through his inventions, i.e. the app's database includes a join table.
- [x] Include user accounts - inventors can create accounts by signing up and later on log in using a username and a password; an inventor has_secure_password. An inspector, who also has_secure_password, cannot create an account - like with the categories, no changes can be made into existing inspectors on the initiative of a user of the app.
- [x] Ensure that users can't modify content created by other users - the app makes sure that the inventor who is trying to modify the content of the invention is the current_user; otherwise the app goes back to the previous view and notifies the user by a red flash message about what they've just done wrong. The same goes for any attempt to delete other inventions than the inventor's own. In fact, even if the inventor is trying to delete their own invention, a separate view makes sure that nothing gets deleted accidentally by asking the user whether they are sure they really want to go ahead with deletion. This view has its own route.
- [x] Include user input validations - if any of the required fields is empty, the app goes back to the previous view. Although this functionality can in principle be handled by a validates_presence_of method in a model, in this case it is implemented simply by if conditionals in the controllers.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - when e.g. creating a new invention (or a new user account for that matter), whenever one or more input fields are empty, the app notifies the user about their mistake with a red flash message.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - all this information is indeed included in the README.md.

Confirm
- [x] You have a large number of small Git commits (looking back I realize that the number of commits is perhaps not sufficiently large - it is very easy to forget to commit when you are carried away by trying to create a functionality you've never tried before.)
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
