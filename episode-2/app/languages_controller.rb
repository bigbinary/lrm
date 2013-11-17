class LanguagesController < UIViewController 

  def viewDidLoad
    super

    self.title = "Programming languages"

    @table = UITableView.alloc.initWithFrame(self.view.bounds) 
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight 
    self.view.addSubview(@table)

    @table.dataSource = self
    @data = programming_languages_list

    @cell_counter = 0
  end 

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
    unless cell
      cell = UITableViewCell.alloc.initWithStyle( UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
      @cell_counter += 1
    end

    #cell = UITableViewCell.alloc.initWithStyle( UITableViewCellStyleDefault, reuseIdentifier:nil)
    #@cell_counter += 1

    cell.textLabel.text = @data[indexPath.row]

    puts @cell_counter

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
