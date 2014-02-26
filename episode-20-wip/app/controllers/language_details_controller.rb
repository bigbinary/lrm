class LanguageDetailsController < UITableViewController

  def initWithLanguage language_name
    @language = Language.where(:name).eq(language_name).first
    self
  end

  def viewDidLoad
    super

    rmq.stylesheet = LanguageDetailsControllerStylesheet

    self.title = @language.name

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
        st.text = @language.name
        st.size_to_fit
      end

      q.append(UILabel, :author_name_label).style do |st|
        st.text = 'Author name:'
      end
      q.append(UILabel, :author_name).style do |st|
        st.text = @language.inventor_name
      end

      q.append(UILabel, :static_label).style do |st|
        st.text = 'Static:'
      end
      q.append(UILabel, :static_value).style do |st|
        st.text = @language.static ? 'True' : 'False'
      end

      q.append(UILabel, :dynamic_label).style do |st|
        st.text = 'Dynamic:'
      end
      q.append(UILabel, :dynamic_value).style do |st|
        st.text = @language.dynamic ? 'True' : 'False'
      end


      rmq.stylesheet.layout_header q
      view.tableHeaderView = q.get
    end
  end

end

