class LanguagesController < UIViewController 

  def viewDidLoad
    super
    self.title = "Programming languages"
    @table = UITableView.alloc.initWithFrame(self.view.bounds) 
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight 
    self.view.addSubview(@table)

    @table.dataSource = self

    language_service = LanguagesService.new
    @data = language_service.all
    @keys = @data.map { |r| r.name }

    @table.delegate = self
  end 

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)

    # DEMO
    cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleValue1, reuseIdentifier:@reuseIdentifier)
    #cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleValue2, reuseIdentifier:@reuseIdentifier)
    #cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)

    row_number = indexPath.row
    key = @keys[row_number]
    cell.textLabel.text = key

    inventor_name = @data[row_number].inventor_name
    cell.detailTextLabel.text = inventor_name

    cell
  end
end

