module ApplicationHelper

  def modal_for(heading, intro, &block)
    render partial:"modal", locals: {heading: heading, intro: intro, block: block}
  end

end
