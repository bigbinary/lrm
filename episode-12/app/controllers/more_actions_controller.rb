class MoreActionsController < BaseLanguagesController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('More ..', image: rmq.image.resource('lightbulb'), tag: 0)
    self.title = 'More'
    self
  end

  def viewDidLoad
    super

    navigationItem.title = 'More'
    view.dataSource = view.delegate = self

    @data = []
    @keys = @data.map { |r| r.name }
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER_FOR_STATIC_LANGUAGES"
    super
  end

end

