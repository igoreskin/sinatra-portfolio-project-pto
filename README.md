Virtual Patent and Trademark Office APP

Sinatra Portfolio Project

This is CRUD application is intended for a nutshell demonstration of how a PTO works, with inventors able to file (create), read, update and delete their inventions, and inspectors who can view inventors' inventions and either grant patents to inventors or reject their applications. Inventors and inspectors have different signup routes which allows to build the controllers so that the application knows the difference between the models and can tell which one of the models is currently logged in. Inventors can only edit and delete their own inventions and cannot change the pending status of the invention, whereas inspectors can only change the invention's patent status and cannot make any other changes into the invention.

From the associations point of view an inventor in this app has many inventions and an invention belongs to an inventor. Inventions may also have one or more categories (the official inventions categories used by the US Patent and Trademark Office), and these categories are linked to the inventors through their inventions. Every page of the app is linked to all the other pages in the way that all the inventions, inventors and categories are presented in the views as links to their own individual views and there are always links to the list of all the inventions and to the logout.

Essentially the entire idea behind the application is to show that differentiation between models and their access rights within an application can be achieved even by using relatively simple Sinatra tools, although further on in Rails this functionality may be made less cumbersome by being abstracted away and thereby simplified from a programmer's standpoint.

Installation instructions

Run bundle install to install all required gems, then run shotgun and click on a link provided in your terminal.

Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/igoreskin/sinatra-portfolio-project-pto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License

Copyright (c) 2017 Igor Eskin

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
