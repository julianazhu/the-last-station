namespace :assets do
  task 'skip_prod_compilation' do
    puts 'Skipping Asset precompilation in PRODUCTION.'
    exit 0 if Rails.env.production?
  end
end

task 'assets:precompile' => 'assets:skip_prod_compilation'
