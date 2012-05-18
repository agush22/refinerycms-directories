Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :directory do
    resources :contacts, :only => [:index, :show]
  end

  # Admin routes
  namespace :directory, :path => '' do
    namespace :admin, :path => 'refinery' do
      scope :path => 'directory' do
        root :to => "contacts#index"
      end
      resources :contacts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :directory do
    resources :categories, :only => [:index, :show]
  end

  # Admin routes
  namespace :directory, :path => '' do
    namespace :admin, :path => 'refinery/directory' do
      resources :categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
