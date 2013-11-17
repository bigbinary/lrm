class LanguagesController < UIViewController 

  def viewDidLoad
    super

    self.title = "Programming languages"

    @table = UITableView.alloc.initWithFrame(self.view.bounds) 
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight 
    self.view.addSubview(@table)

    @table.dataSource = self
    @data = programming_languages_list

    @table.delegate = self
  end 

  def tableView(tableView, didSelectRowAtIndexPath:indexPath) 
    tableView.deselectRowAtIndexPath(indexPath, animated: true) 
    language = @data[indexPath.row]

    controller = UIViewController.alloc.initWithNibName(nil, bundle:nil)
    controller.view.backgroundColor = UIColor.whiteColor
    controller.title = language

    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.text = language
    label.sizeToFit
    label.center = [controller.view.frame.size.width / 2, controller.view.frame.size.height / 2]

    controller.view.addSubview(label)
    self.navigationController.pushViewController(controller, animated:true)
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)

    cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    cell.textLabel.text = @data[indexPath.row]

    # DEMO
    row_number = indexPath.row

    case row_number
    when 1
      cell.accessoryType = UITableViewCellAccessoryNone
    when 2
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    when 3
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
    when 4
      cell.accessoryType = UITableViewCellAccessoryCheckmark
    when 5
      cell.accessoryType = UITableViewCellAccessoryDetailButton
    else
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    end

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
