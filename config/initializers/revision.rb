sha = if File.exist? 'REVISION'
  File.open('REVISION').read
elsif `which git`
  %x{ git rev-parse --verify HEAD --short }
end

branch = if File.exist? 'BRANCH'
  File.open('BRANCH').read
elsif `which git`
  %x{ git rev-parse --abbrev-ref HEAD }
end

DEPLOYED_GIT_BRANCH   = branch.to_s.strip
DEPLOYED_GIT_REVISION = sha.to_s.strip[0...7]
