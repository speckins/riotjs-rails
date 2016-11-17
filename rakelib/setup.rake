desc "Build vendor files from submodules and copy into gem"
task :setup => ['setup:copy_compiler', 'setup:copy_assets']
task :build => :setup

namespace :setup do

  compiler_files = FileList.new 'lib/riot-compiler/lib/.'
  asset_files    = FileList.new 'lib/riot/riot.js', 'lib/riot/riot.min.js'

  directory 'lib/support/compiler'
  directory 'vendor/assets/javascripts'

  # Remove files imported from submodules
  CLOBBER.include FileList['lib/support/compiler/**/*.js']
  CLOBBER.include FileList['vendor/assets/javascripts/**/*.js']


  # Copy riot compiler from submodule to gem

  task :copy_compiler => [:build_compiler, 'lib/support/compiler'] do
    cp_r compiler_files, 'lib/support/compiler/'
  end


  # Copy riot to vendor/assets/javascripts

  task :copy_assets => [:init_submodules, 'vendor/assets/javascripts'] do
    cp asset_files, 'vendor/assets/javascripts/'
  end


  # Initialize and update git submodules (riot, riot-compiler)

  task :init_submodules do
    system 'git submodule init'   or abort 'Failed to initialize submodules'
    system 'git submodule update' or abort 'Failed to update submodules'
  end


  # Build riot-compiler

  task :build_compiler => :init_submodules do
    unless File.exist? 'lib/riot-compiler/lib/compiler.js'
      Dir.chdir 'lib/riot-compiler/' do
        system 'npm install'    or abort 'Failed to run "npm install"'
        system 'make pre-build' or abort 'Failed to run "make"'
      end
    end
  end

end
