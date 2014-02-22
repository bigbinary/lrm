class AllLanguagesController < BaseLanguagesController 

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('All', image: rmq.image.resource('bell'), tag: 0)
    self.title = 'All'
    self
  end

  def viewDidLoad
    super

    navigationItem.title = 'All languages'
    view.dataSource = view.delegate = self

    language_service = rmq.app.delegate.language_service
    @data = language_service.all
    @keys = @data.map { |r| r.name }
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER_FOR_ALL_LANGUAGES"
    super
  end


end

