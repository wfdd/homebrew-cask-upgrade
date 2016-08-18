require "extend/hbc"

module Bcu
  def self.process(args)
    Hbc.outdated.each do |app|
      if system "brew cask fetch #{app[:name]}"
        puts "==> Upgrading #{app[:name]} to #{app[:latest]}"
        system "brew cask uninstall #{app[:name]} --force"
        system "brew cask install #{app[:name]}"
      else
        puts "==> Skipping #{app[:name]}; unable to fetch version #{app[:latest]}"
      end
    end
  end
end
