class MoreActionsController < BaseLanguagesController

  SECURITY_SECTION = 0
  LOCK_CODE_ROW_NUMBER = 0
  CLEAR_CODE_ROW_NUMBER = 1
  LOGOUT_ROW_NUMBER = 2
  NUMBER_OF_ROWS_IN_SECURITY_SECTION = 3

  APP_VERSION_SECTION = 1
  APP_VERSION_ROW_NUMBER = 0
  NUMBER_OF_ROWS_IN_APP_VERSION_SECTION = 1

  CLEAR_LOCK_CODE_TEXT = "Clear Lock Code"
  SET_LOCK_CODE_TEXT = 'Set Lock Code'
  CHANGE_LOCK_CODE_TEXT = 'Change Lock Code'
  LOGOUT_TEXT = 'Logout'

  def init
    super
    initWithStyle(UITableViewStyleGrouped)
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('More ..', image: rmq.image.resource('lightbulb'), tag: 0)
    self.title = 'More'
    self
  end

  def viewDidLoad
    super
  end

  def viewDidAppear animated
    view.reloadData
  end

  def numberOfSectionsInTableView tableView
    2
  end

  def tableView(tableView, numberOfRowsInSection: indexPath)
    if indexPath == 0
      NUMBER_OF_ROWS_IN_SECURITY_SECTION
    else
      NUMBER_OF_ROWS_IN_APP_VERSION_SECTION
    end
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:CellID)
    cell.userInteractionEnabled = true
    cell.textLabel.textColor = rmq.color.black

    case indexPath.section

    when SECURITY_SECTION
      display_non_version_section indexPath, cell

    when APP_VERSION_SECTION
      display_version_section indexPath, cell
    end

    cell
  end

  def tableView(tableView, titleForHeaderInSection: section)
    section == 0 ? "Security" : "App Version Info"
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    selectedCell = tableView.cellForRowAtIndexPath(indexPath)
    text = selectedCell.textLabel.text

    case text 
    when CLEAR_LOCK_CODE_TEXT
      handle_clearing_lock_code indexPath

    when SET_LOCK_CODE_TEXT 
      self.navigationController.pushViewController(ManageLockCodeController.alloc.initAndSetCode, animated: true)

    when CHANGE_LOCK_CODE_TEXT 
      self.navigationController.pushViewController(ManageLockCodeController.alloc.initAndChangeCode, animated: true)

    when LOGOUT_TEXT
      App.alert 'logout functionality is coming up'

    else 
      App.alert "Error: #{text} was not captured above"
    end
  end

  private

  def handle_clearing_lock_code indexPath
    LockCode.set nil
    App.alert 'Lock code has been cleared'
    view.reloadData
  end

  def display_non_version_section indexPath, cell
    case indexPath.row
    when LOCK_CODE_ROW_NUMBER
      cell.textLabel.text = LockCode.enabled? ? CHANGE_LOCK_CODE_TEXT : SET_LOCK_CODE_TEXT
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    when CLEAR_CODE_ROW_NUMBER
      cell.textLabel.text = CLEAR_LOCK_CODE_TEXT

    when LOGOUT_ROW_NUMBER
      cell.textLabel.text = 'Logout'
    end
  end

  def display_version_section indexPath, cell
    case indexPath.row
    when APP_VERSION_ROW_NUMBER
      cell.textLabel.text = 'App Version'
      cell.userInteractionEnabled = false
      cell.detailTextLabel.text = '0.0.1'
    end
  end

end
