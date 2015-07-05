module ApplicationHelper

  def full_title(page_title)
    base_title = Rails.application.name
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end

  def modal(name, id, partial)
    content_tag(:div, class: ['modal', 'fade'], id: id) do
      content_tag(:div, class: 'modal-dialog') do
        content_tag(:div, class: 'modal-content') do
          content_tag(:div, content_tag(:button, '&times;'.html_safe, class: 'close', data: { dismiss: 'modal' }) + content_tag(:h3, name, class: 'modal-title'), class: 'modal-header') +
            content_tag(:div, render(partial), class: 'modal-body') +
            content_tag(:div, content_tag(:button, 'Close', class: ['btn', 'btn-default'], data: { dismiss: 'modal' }), class: 'modal-footer')
        end
      end
    end
  end

  NavLink = Struct.new(:name, :url, :method)

  def nav_links
    @nav_links = [
      ['Home', home_path],
      ['About', about_path],
    ]
    logged_in = [
      ['Entries', gas_entries_path],
      ['Stations', stations_path],
      [current_user.name, user_path(current_user)],
      ['Log Out', logout_path, :post]
    ]
    logged_out = [
      ['Sign Up', new_user_path],
      ['Log In', login_path],
    ]
    @nav_links.concat(user_logged_in? ? logged_in : logged_out)
    @nav_links.map { |link| NavLink.new(*link) }
  end

  def nav_tabs
    @nav_tabs = [
      ['Dashboard', dashboard_path],
      ['Add Fill-Up', new_gas_entry_path],
      ['All Gas Entries', gas_entries_path],
      ['All Stations', stations_path],
      ['Instructions', instructions_path],
      ["#{Time.now.year} Statistics", statistics_path]
    ]
    @nav_tabs.map { |tab| NavLink.new(*tab) }
  end

  def active?(page)
    current_page?(page) ? 'active' : ''
  end

  def add_station_fields(form)
    new_object = form.object.build_station
    id = new_object.object_id
    fields = begin
      content_tag(:div, class: 'well') do
        content_tag(:h2, 'Add New Station') +
        form.fields_for(:station) { |station_form| render 'stations/fields', form: station_form }
      end
    end
    link_to 'Add New Station', '#', id: 'add_station', class: 'btn btn-lg btn-block btn-default', data: { id: id, fields: fields.gsub("\n", '') }
  end

end
