class DynamicLanguagesController < BaseLanguagesController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Dynamic', image: rmq.image.resource('binocular'), tag: 0)
    self.title = 'Dynamic'
    self
  end

  def viewDidLoad
    super

    navigationItem.title = 'Dynamic languages'
    view.dataSource = view.delegate = self

    language_service = rmq.app.delegate.language_service
    @data = language_service.dynamic
    @keys = @data.map { |r| r.name }
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER_FOR_DYNAMIC_LANGUAGES"
    super
  end

end

