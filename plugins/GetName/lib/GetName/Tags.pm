package GetName::Tags;

use strict;

sub _hdlr_get_name {
    my ( $ctx, $args, $cond ) = @_;
    my $model = lc( $args->{ model } );
    my $id = $args->{ id };
    return '' unless $id;
    return '' if ( $model eq 'author' );
    return '' if ( $model eq 'config' );
    my $obj = MT->model( $model )->load( $id );
    return '' unless $obj;
    if ( $obj->has_column( 'name' ) ) {
        return $obj->name;
    } elsif ( $obj->has_column( 'label' ) ) {
        return $obj->label;
    } elsif ( $obj->has_column( 'title' ) ) {
        return $obj->title;
    }
}

1;