class LanguagesController < UIViewController 

  def viewDidLoad
    super
    self.title = "Programming languages"
    @table = UITableView.alloc.initWithFrame(self.view.bounds) 
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight 
    self.view.addSubview(@table)

    @table.dataSource = self
    @data = programming_languages_list
    @keys = @data.keys

    @table.delegate = self
  end 

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)

    # DEMO
    #cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleValue1, reuseIdentifier:@reuseIdentifier)
    cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleValue2, reuseIdentifier:@reuseIdentifier)
    #cell ||= UITableViewCell.alloc.initWithStyle( UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)

    key = @keys[indexPath.row]
    cell.textLabel.text = key

    inventor = @data[key][:inventor]
    cell.detailTextLabel.text = inventor

    cell
  end

  def programming_languages_list
    {
      'C' => { inventor: 'Dennis Ritchie', link: 'http://en.wikipedia.org/wiki/Dennis_Ritchie' },
      'Java' => { inventor: 'James Gosling', link: 'http://en.wikipedia.org/wiki/James_Gosling' },
      'Objective-C' => { inventor: 'Brad Cox', link: 'http://en.wikipedia.org/wiki/Brad_Cox' },
      'C++' => { inventor: 'Bjarne Stroustrup', link: 'http://en.wikipedia.org/wiki/Bjarne_Stroustrup' },
      'PHP' => { inventor: 'Rasmus Lerdorf', link: 'http://en.wikipedia.org/wiki/Rasmus_Lerdorf' },
      'C#' => { inventor: 'Anders Hejlsberg', link: 'http://en.wikipedia.org/wiki/Anders_Hejlsberg' },
      'Python' => { inventor: 'Guido van Rossum', link: 'http://en.wikipedia.org/wiki/Guido_van_Rossum'},
      'JavaScript' => { inventor: 'Brendan Eich', link: 'http://en.wikipedia.org/wiki/Brendan_Eich' },
      'Perl' => { inventor: 'Larry Wall', link: 'http://en.wikipedia.org/wiki/Larry_Wall' },
      'Ruby' => { inventor: 'Matz', link: 'http://en.wikipedia.org/wiki/Yukihiro_Matsumoto' },
      'Pascal' => { inventor: 'Blaise Pascal', link: 'http://en.wikipedia.org/wiki/Blaise_Pascal' },
      'Lisp' => { inventor: 'John McCarthy', link: 'http://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)'},
      'Groovy' => { inventor: 'James Strachan', link: 'http://en.wikipedia.org/wiki/James_Strachan_(programmer)'},
      'Cobol' => { inventor: 'Grace Hopper', link: 'http://en.wikipedia.org/wiki/Grace_Hopper'},
      'Erlang' => { inventor: 'Joe Armstrong', link: 'http://en.wikipedia.org/wiki/Joe_Armstrong_(programming)'}, 
      'Clojure' => { inventor: 'Rich Hickey', link: 'http://en.wikipedia.org/wiki/Clojure'},
      'Haskell' => { inventor: 'Simon Peyton Jones', link: 'http://en.wikipedia.org/wiki/Simon_Peyton_Jones'},
      'ML' => { inventor: 'Robin Milner', link: 'http://en.wikipedia.org/wiki/Robin_Milner'},
      'Scheme' => { inventor: 'Guy L. Steele, Jr.', link: 'http://en.wikipedia.org/wiki/Guy_L._Steele'},
      'Scala' => { inventor: 'Martin Odersky', link: 'http://en.wikipedia.org/wiki/Martin_Odersky'},
      'Lua' => { inventor: 'Roberto Ierusalimschy', link: 'http://en.wikipedia.org/wiki/Roberto_Ierusalimschy'},
      'Fortran' => { inventor: 'John Backus', link: 'http://en.wikipedia.org/wiki/John_Backus'},
      'ASP' => { inventor: 'Microsoft', link: 'http://en.wikipedia.org/wiki/Active_Server_Pages'},
      'Cold Fusion' => { inventor: 'Adobe systems', link: 'http://en.wikipedia.org/wiki/Adobe_ColdFusion'},
      'MATLAB' => { inventor: 'Mathworks', link: 'http://en.wikipedia.org/wiki/MATLAB'},
      'Smalltalk' => { inventor: 'Alan Kay', link: 'http://en.wikipedia.org/wiki/Alan_Kay'},
      'OCaml' => { inventor: 'INRIA', link: 'http://en.wikipedia.org/wiki/INRIA'},
      'Tcl' => { inventor: 'John Ousterhout', link: 'http://en.wikipedia.org/wiki/John_Ousterhout'}
    }
  end

end
