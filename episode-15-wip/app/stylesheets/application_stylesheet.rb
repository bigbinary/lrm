class ApplicationStylesheet < RubyMotionQuery::Stylesheet
  attr_accessor :margin, :margin_double, :margin_section, :margin_pair, :margin_and_half

  KEYBOARD_HEIGHT = 216
  NAV_HEIGHT = 64

  def initialize(controller)
    super

    @margin_pair = 2
    @margin = 10
    @margin_and_half = 15
    @margin_double = 20
    @margin_section = 40
  end

  def application_setup
  end

  def standard_label_title(st)
    st.number_of_lines = :unlimited
    st.height = 30
  end

  def standard_label_note(st)
    st.number_of_lines = :unlimited
    st.height = 50
    st.color = color.gray
  end

  def standard_button(st)
    st.height = 35
    st.color = color.white
    st.background_color = color.tint_color
    st.view.font = font.large
  end

  def standard_button_as_link(st)
    st.height = 35
    st.color = color.tint_color
    st.view.titleLabel.lineBreakMode = NSLineBreakByWordWrapping
    st.view.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft
  end

  def standard_text_field(st)
    st.height = 25
    st.background_color = color.white
    st.view.tap do |view|
      #view.text = '' # Keep this here, solves bug
      #view.placeholder = 'Foo'
      #view.clearButtonMode = UITextFieldViewModeWhileEditing
      #view.keyboardType = UIKeyboardTypeDefault
      view.font = font.large
      view.borderStyle = UITextBorderStyleRoundedRect
      #view.autocorrectionType = UITextAutocorrectionTypeYes
      #view.autocapitalizationType = UITextAutocapitalizationTypeNone
    end
  end

  def standard_text_view(st)
    st.height = 50
    st.background_color = color.white
    st.view.font = font.large

    # Text views don't have UITextBorderStyleRoundedRect, so we'll draw it
    st.view.layer.tap do |layer|
      layer.borderWidth = 0.5 
      layer.borderColor = color.from_hex('B9B9B9').CGColor
      layer.cornerRadius = 5
      layer.masksToBounds = true
    end
  end

  def overlay(st)
    st.frame = :full
    st.background_color = color.transparent_black
  end
  def overlay_photo(st)
    st.frame = :full
    st.view.contentMode = UIViewContentModeScaleAspectFit
  end
  def overlay_note(st)
    st.frame = {l: 0, w: app_width, h: 20}
    st.from_bottom = 5
    st.font = font.medium
    st.color = color.white
    st.text_alignment = :center
    st.text = 'Touch anywhere to close'
  end

end

class StandardAppearance
  class << self
    def set_named_fonts_and_colors
      rmq = RubyMotionQuery::RMQ
      font = rmq.font
      color = rmq.color

      font_family = 'HelveticaNeue-Light'
      font_family_large = 'HelveticaNeue-UltraLight'
      font.add_named :huge,           font_family_large, 48
      font.add_named :larger,         font_family, 30
      font.add_named :large,          font_family, 20
      font.add_named :medium,         font_family, 16
      font.add_named :small,          font_family, 12
      font.add_named :tiny,           font_family, 9

      color.add_named :tint_color,     '3F5C7A'

      color.add_named :olive_green,    '838E61'
      color.add_named :charcoal_gray,  '262626'
      color.add_named :dim_gray,       '7F7F7F'
      color.add_named :light_gray,     'F1F1F1'
      color.add_named :border_color,   'DDDDDD'
      color.add_named :burnt_orange,   'D56217'
      color.add_named :light_peach,    color.from_rgba(250, 57, 66, 0.330)

      color.add_named :transparent_black, color.from_rgba(0, 0, 0, 0.70)
    end
    
    def apply
      # Available items that can be styled in here
      # UIActivityIndicatorView
      # UIBarButtonItem
      # UIBarItem
      # UINavigationBar
      # UIPopoverController
      # UIProgressView
      # UISearchBar
      # UISegmentedControl
      # UISlider
      # UISwitch
      # UITabBar
      # UITabBarItem
      # UIToolbar
      # UIView
      # UIViewController
      # UIWindow

      rmq = RubyMotionQuery::RMQ
      font = rmq.font
      color = rmq.color

      set_named_fonts_and_colors

      UIWindow.appearance.tap do |o|
        o.tintColor = color.tint_color
      end

      #UIButton.appearance.tap do |o|
        #o.tintColor = color.tint_color
      #end

      UILabel.appearance.tap do |o|
        o.setTextColor color.charcoal_gray
        o.setFont font.large
      end

      UINavigationBar.appearance.tap do |o| 
        o.barTintColor = color.olive_green
        o.tintColor = color.white

        o.setTitleTextAttributes( {
          UITextAttributeFont => font.large,
          UITextAttributeTextColor => color.black
        })
      end

      UITabBar.appearance.tap do |o|
        o.tintColor = color.tint_color
      end
      UITabBarItem.appearance.tap do |o|
        o.setTitleTextAttributes( {
          UITextAttributeFont => font.small,
          UITextAttributeTextColor => color.dim_gray
        }, forState: UIControlStateNormal)

        o.setTitleTextAttributes( {
          UITextAttributeFont => font.small,
          UITextAttributeTextColor => color.tint_color
        }, forState: UIControlStateSelected)
      end

      #UIView.appearance.tap do |o|
        #o.setTextColor color.charcoal_gray
        #o.setFont font.medium
      #end

      #UIBarItem.appearance.tap do |o| 
        #o.setTitleTextAttributes( {
          #UITextAttributeFont => font.medium,
          #UITextAttributeTextColor => color.white
        #}, forState: UIControlStateNormal)
        #o.setTitleTextAttributes( {
          #UITextAttributeFont => font.large,
          #UITextAttributeTextColor => color.white
        #})
      #end

      #UIBarButtonItem.appearance.tap do |o| 
        #o.setTitleTextAttributes( {
          #UITextAttributeFont => font.large,
          #UITextAttributeTextColor => color.red
        #}, forState: UIControlStateNormal)

        #o.setTitleTextAttributes( {
          #UITextAttributeFont => font.large,
          #UITextAttributeTextColor => color.black
        #}, forState: UIControlStateHighlighted)
      #end



    end

  end
end

