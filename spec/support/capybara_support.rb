# fill_in_fields user_email: 'bob@smith.com'
# fill_in_fields :user, email: 'bob@smith.com'
def fill_in_fields *args
  raise 'Too many arguments!' if args.size > 2
  prefix = args.first.is_a?(Hash) ? '' : "#{ args.shift }_"
  args.last.each { |field, value| fill_in "#{ prefix }#{ field }", with: value }
end

def should_be_on path
  current_path.should == path.split('?').first # ignores query string
end

def should_not_be_on path
  current_path.should_not == path.split('?').first # ignores query string
end
