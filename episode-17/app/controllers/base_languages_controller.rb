class BaseLanguagesController < UITableViewController 

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)

    cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleValue1, reuseIdentifier:@reuseIdentifier)

    row_number = indexPath.row
    key = @keys[row_number]
    cell.textLabel.text = key
    inventor_name = @data[row_number].inventor_name
    cell.detailTextLabel.text = inventor_name
    cell
  end

end
