# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'refinerycms-directory'
  s.version = '1.0.2'
  s.description = 'Ruby on Rails Directory extension for Refinery CMS'
  s.date = '2012-05-17'
  s.summary = 'Directory extension for Refinery CMS'
  s.require_paths = %w(lib)
  s.files = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors = 'Agustín Leñero'
  s.homepage = 'http://innku.com'
  s.email = 'webmaster@innku.com'
  # Runtime dependencies
  s.add_dependency    'refinerycms-core', '~> 2.0.4'
  s.add_dependency    'acts-as-taggable-on'
  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.4'
end
