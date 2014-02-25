class LanguageDetailsController < UITableViewController

  def initWithLanguage language_name
    @language_name = language_name
    self
  end

  def viewDidLoad
    super

    rmq.stylesheet = LanguageDetailsControllerStylesheet

    self.title = @language_name

    view.tap do |table|
      table.delegate = self
      #table.datasource = self
      rmq(table).apply_style :table
    end

    create_header_view
  end

  def tableView(tableView, numberOfRowsInSection: section)
    1
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
    unless cell
      cell = UITableViewCell.alloc.initWithStyle( UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end
    cell.textLabel.text = 'Hello'
    cell
  end

  private

  def create_header_view
    rmq.create(UIView, :header).tap do |q|
      q.append(UILabel, :language_name).style do |st|
        st.text = @language_name
        st.size_to_fit
      end
      rmq.stylesheet.layout_header q
      view.tableHeaderView = q.get
    end
  end

end

