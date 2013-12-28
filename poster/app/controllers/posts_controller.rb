class PostsController < UITableViewController

  ALL_POSTS_END_POINT = 'http://lrm-authentication-production.herokuapp.com/v1/posts'
  ALL_POSTS_END_POINT = 'http://127.0.0.1:9999/v1/posts'

  def viewDidLoad
    super

    right_button_items = [UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh,
                                                                            target: self,
                                                                            action: 'refresh')
                          ]

    navigationItem.rightBarButtonItems = right_button_items

    rmq.stylesheet = PostsControllerStylesheet
    rmq(self.view).apply_style :root_view
    rmq(self.tableView).apply_style :table

    @cell_counter = 0
    @posts = posts_data

    self.refreshControl = UIRefreshControl.alloc.init.tap do |o|
      o.addTarget(self, action: :refresh_control_changed, forControlEvents: UIControlEventValueChanged)
      o.attributedTitle = NSAttributedString.alloc.initWithString('Pull to refresh')
    end

  end

  def tableView(table_view, numberOfRowsInSection: section)
    @posts.size
  end

  CELL_IDENTIFIER = "CELL_IDENTIFIER"

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER)
    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: CELL_IDENTIFIER)
      @cell_counter += 1
    end
    cell.textLabel.text = @posts[indexPath.row]["title"]
    puts @cell_counter
    cell
  end


  def refresh_control_changed
    self.refreshControl.endRefreshing
    refresh
  end

  def refresh
    load_data
  end

  def load_data
    view.reloadData
    fetch_all_posts_from_server
  end

  def fetch_all_posts_from_server
    #hash = {authToken: App::Persistence['authToken'], userEmail: App::Persistence['userEmail']}
    #payload = BW::JSON.generate(hash)
    headers = {'Content-Type' => 'application/json'}
    BW::HTTP.get(ALL_POSTS_END_POINT, {headers: headers}) do |response|
      @posts = BW::JSON.parse(response.body.to_str)["posts"]
    end
  end

  def posts_data
    [{"content" => "Welcome to my new Post", "title" => "My First Post"},
     {"content" => "This is where I write about another technical discussions.", "title" => "A new day"}]
  end

end

