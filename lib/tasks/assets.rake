namespace :assets do
  task 'skip_prod_precompilation' do
    if Rails.env.production? && !ENV['LOCAL_PRECOMPILE']
      puts 'Skipping Asset precompilation in PRODUCTION'
      exit 0
    end
    puts 'Precompiling assets locally in PRODUCTION mode'
    ENV['RAILS_ENV'] = 'production'
  end
end

task 'assets:precompile' => 'assets:skip_prod_precompilation'
