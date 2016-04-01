# Alfred Workflow for BetaList

![](https://github.com/betalist/alfred-workflow/raw/master/screenshot.jpg)

Browse and search through the latest startups right from within Alfred.

Based on [alfred-provider-suggest][3]

# Installation instructions

1. [Download the Workflow][2]
2. Open the file
3. Click ‘Import’ to add it to your Alfred Workflows.
4. Type 'beta' for the latest startups or 'beta query' to search for startups by name (replace 'query').

# Development

This project uses the Bundler [`--standalone`][1] flag in order to run completely stand alone on OS X 10.10 setups (as that's first OS X that ships with built in Ruby 2.0). Bare setups do not have bundler installed (and it's a bitch to setup system ruby properly anyway), so the regular way of using Bundler is not feasible.

The way it works is that it creates a custom `setup.rb` that adds all gems to the load path. As you can see in `startups.rb`, instead of requiring `bundler/setup` we load this file.

This has some caveats though. When developing you need to run 2.0.0 locally in order for the standalone Bundler setup to work, as the gems are loaded for this specific Ruby version. When `bundle`ing you also need to have bundler installed. I found it easiest to install and use Ruby 2.0.0 via rbenv.

So when you've added a new Gem to the Gemfile, run:

```
bundle install --standalone
```

and all should be fine.


# Releasing

Alfred Workflow files are basically just regular zip files with a different extension. Instead of having this repo somewhere deep in the bowels of your Alfred application, it's easier to generate a new `.alfredworkflow` every time you want to release a new version. I keep a copy of the latest `.alfredextension` in this repository.

```
zip -9 -r --exclude=*.git* alfred-betalist.alfredworkflow .
```

*Note*: If you use zsh you need to add backslashes before the asterixes.

[1]: http://bundler.io/v1.7/man/bundle-install.1.html
[2]: https://github.com/betalist/alfred-workflow/raw/master/alfred-betalist.alfredworkflow
[3]: https://github.com/djfpaagman/alfred-provider-suggest
