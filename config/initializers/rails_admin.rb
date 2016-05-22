RailsAdmin.config do |config|

  ### Popular gems integration
  config.main_app_name = ["宣顺化工贸易有限公司", "信息发布系统"]
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    grid
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Product' do
    list do
      field :name
      field :category
      field :price
      # field :picture
    end

    grid do
      thumbnail_method do
        field :name
        :thumb
      end
    end
  end
end
