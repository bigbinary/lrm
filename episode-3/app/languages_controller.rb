class LanguagesController < UIViewController 

  def viewDidLoad
    super

    self.title = "Programming languages"

    @table = UITableView.alloc.initWithFrame(self.view.bounds) 
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight 

    # Demo 1
    #@table.separatorStyle = UITableViewCellSeparatorStyleSingleLine
    #@table.separatorStyle = UITableViewCellSeparatorStyleNone
    @table.separatorColor = UIColor.redColor

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

    # Demo 2
    #cell.textLabel.textAlignment = UITextAlignmentCenter
    #cell.textLabel.textAlignment = UITextAlignmentLeft
    cell.textLabel.textAlignment = UITextAlignmentRight

    # Demo  3
    #cell.textLabel.textColor = UIColor.redColor
    #cell.textLabel.textColor = UIColor.blueColor

    # Demo 4
    #cell.textLabel.text = @data[indexPath.row]  * 7
    #cell.textLabel.adjustsFontSizeToFitWidth = true

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
