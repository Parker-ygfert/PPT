module ApplicationHelper
  def navbar_title
    # if controller_name == 'boards' && action_name == 'index'
    #   '【所有看板】'
    # else
    #   '【主功能表】'
    # end
    case [controller_name, action_name]
    when ['boards', 'index']
      '【所有看板】'
    else
      '【主功能表】'
    end
  end
end