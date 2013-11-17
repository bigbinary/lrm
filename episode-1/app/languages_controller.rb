class LanguagesController < UIViewController 

  def viewDidLoad
    super

    self.title = "Programming languages"

    @table = UITableView.alloc.initWithFrame(self.view.bounds) 
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight 
    self.view.addSubview(@table)

    @table.dataSource = self
    @data = programming_languages_list
  end 

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = UITableViewCell.alloc.initWithStyle( UITableViewCellStyleDefault, reuseIdentifier:nil)
    cell.textLabel.text = @data[indexPath.row]

    cell
  end

  def programming_languages_list
    %w(
      C 
      Java
      Objective-C
      C++
      PHP 
      C#
      Python
      JavaScript
      Brendan Eich
      Perl
      Larry Wall
      Ruby
      Pascal
      Lisp
      Groovy
      Cobol
      Erlang
      Clojure
      Haskell
      ML
      Scheme
      Scala
      Lua
      Fortran
      ASP
      Cold Fusion
      MATLAB
      Smalltalk
      OCaml
      Tcl
    )
  end

end
