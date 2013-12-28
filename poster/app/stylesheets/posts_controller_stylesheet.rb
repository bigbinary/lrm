class PostsControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    @margin = 10
  end

  def root_view(st)
    st.background_color = color.white
  end

  def table(st)
    st.view.separatorColor = color.clear
    st.view.contentInset = [20, 0, 10, 0]
    st.view.separatorColor = color.border_color
    st.view.separatorStyle = UITableViewCellSeparatorStyleSingleLine
  end

end
