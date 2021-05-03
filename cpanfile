requires 'Moo';
requires 'namespace::autoclean';
requires 'YAML::XS';
requires 'File::ShareDir';
requires 'Scalar::Util';
requires 'Format::Util::Numbers';

on test => sub {
    requires 'Test::More';
    requires 'Test::Warnings';
};
