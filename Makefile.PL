
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A tool for routing paths",
  "AUTHOR" => "Stevan Little <stevan\@iinteractive.com>",
  "BUILD_REQUIRES" => {
    "Test::Fatal" => 0,
    "Test::More" => "0.88"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Path-Router",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Path::Router",
  "PREREQ_PM" => {
    "Data::Dumper" => 0,
    "Eval::Closure" => "0.06",
    "File::Spec::Unix" => 0,
    "Moose" => "0.74",
    "MooseX::Clone" => "0.04",
    "Sub::Exporter" => 0,
    "Term::ReadLine" => 0,
    "Test::Builder" => 0,
    "Test::Deep" => 0,
    "Try::Tiny" => 0
  },
  "VERSION" => "0.12",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



