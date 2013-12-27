class LanguagesService

  def initialize
    build_languages
  end

  def all
    Language.order(:name).all
  end

  def static
    Language.order(:name).where(:static).eq('true')
  end

  def dynamic
    Language.order(:name).where(:dynamic).eq('true')
  end

  private

  def build_languages
    Language.delete_all

    array = %w(
      c
      java
      objective_c
      c_plus_plus
      php
      c_sharp
      python
      javascript
      perl
      ruby_lang
      pascal
      lisp
      groovy
      cobol
      erland
      clojure
      haskell
      ml
      scheme
      scala
      lua
      fortran
      smalltalk
      ocaml
      tcl
    )

    b = array.map { |r| self.send r.intern }
    puts b.inspect
    b.each do |language|
      puts language[:name]
      Language.create language
    end
  end

  def c
    { 
      name: 'C',
      static: 'true',
      inventor_name: 'Dennis Ritchie',
      wikipedia_link: '',
      inventor_wikipedia_link:  'http://en.wikipedia.org/wiki/Dennis_Ritchie' 
    }
  end

  def java
    {
      name: 'Java', 
      inventor_name: 'James Gosling',   
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/James_Gosling' 
    }
  end

  def objective_c
    {
      name: 'Objective-C',
      inventor_name: 'Brad Cox',        
      static: 'true',
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Brad_Cox'
    }
  end

  def c_plus_plus
    { 
      name: 'C++',
      inventor_name: 'Bjarne Stroustrup', 
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Bjarne_Stroustrup' 
    }
  end

  def php
    {
      name: 'PHP',
      inventor_name: 'Rasmus Lerdorf',  
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Rasmus_Lerdorf'
    }
  end

  def c_sharp
    {
      name: 'C#',
      inventor_name: 'Anders Hejlsberg', 
      static: 'true',
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Anders_Hejlsberg'
    }
  end


  def python
    {
      name: 'Python',
      inventor_name: 'Guido van Rossum', 
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Guido_van_Rossum'
    }
  end

  def javascript
    {
      name: 'JavaScript',
      inventor_name: 'Brendan Eich',    
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Brendan_Eich'
    }
  end

  def perl
    {
      name: 'Perl',
      inventor_name: 'Larry Wall',      
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Larry_Wall' 
    }
  end

  def ruby_lang
    {
      name: 'Ruby',
      inventor_name: 'Matz',            
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Yukihiro_Matsumoto' 
    }
  end

  def pascal
    {
      name: 'Pascal',
      inventor_name: 'Blaise Pascal',   
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Blaise_Pascal' 
    }
  end

  def lisp
    {
      name: 'Lisp',
      inventor_name: 'John McCarthy',   
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)'
    }
  end

  def groovy
    {
      name: 'Groovy', 
      inventor_name: 'James Strachan',  
      static: 'true',
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/James_Strachan_(programmer)'
    }
  end

  def cobol
    {
      name: 'Cobol',
      inventor_name: 'Grace Hopper',    
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Grace_Hopper'
    }
  end

  def erland
    {
      name: 'Erlang',
      inventor_name: 'Joe Armstrong',   
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Joe_Armstrong_(programming)'
    }
  end

  def clojure
    {
      name: 'Clojure',
      inventor_name: 'Rich Hickey',     
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Clojure'
    }
  end

  def haskell
    {
      name: 'Haskell',
      inventor_name: 'Simon Peyton Jones', 
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Simon_Peyton_Jones'
    }
  end

  def ml
    {
      name: 'ML',
      inventor_name: 'Robin Milner',    
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Robin_Milner'
    }
  end

  def scheme
    {
      name: 'Scheme',
      inventor_name: 'Guy L. Steele, Jr.', 
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Guy_L._Steele'
    }
  end

  def scala
    {
      name: 'Scala',
      inventor_name: 'Martin Odersky',  
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Martin_Odersky'
    }
  end

  def lua
    {
      name: 'Lua',
      inventor_name: 'Roberto Ierusalimschy', 
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Roberto_Ierusalimschy'
    }
  end

  def fortran
    {
      name: 'fortran',
      inventor_name: 'John Backus',     
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/John_Backus'}
  end

  def smalltalk
    {
      name: 'Smalltalk',
      inventor_name: 'Alan Kay',        
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/Alan_Kay'
    }
  end

  def ocaml
    {
      name: 'OCaml',
      inventor_name: 'INRIA',           
      static: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/INRIA'
    }
  end

  def tcl
    {
      name: 'Tcl',
      inventor_name: 'John Ousterhout', 
      dynamic: 'true',
      wikipedia_link: '',
      inventor_wikipedia_link: 'http://en.wikipedia.org/wiki/John_Ousterhout'
    }
  end
end
