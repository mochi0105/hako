use Plack::Builder;
use File::Spec;
use File::Basename;
use Hako::Config;
use Hako::MenteApp;

require 'hako-main.cgi';

my $main_app = MainApp::to_app();
my $mente_app = Hako::MenteApp::to_app();

builder {
    #enable 'Plack::Middleware::Static',
        #path => sub {print shift; 0},
        #root => File::Spec->catdir(dirname(__FILE__));
    enable 'Plack::Middleware::Static',
        path => qr{^(?:/img/)},
        root => File::Spec->catdir(dirname(__FILE__));
    enable 'Plack::Middleware::Static',
        path => qr{(?:favicon.ico)},
        root => File::Spec->catdir(dirname(__FILE__));
    mount "/mente" => $mente_app;
    mount "/" => $main_app;
};
