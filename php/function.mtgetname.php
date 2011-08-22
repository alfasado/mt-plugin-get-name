<?php
function smarty_function_mtgetname( $args, &$ctx ) {
    $app = $ctx->stash( 'bootstrapper' );
    $model = $args[ 'model' ];
    $id = $args[ 'id' ];
    if (! $id ) return '';
    $terms = $id;
    $obj = $app->load( $model, $terms );
    if ( isset( $obj ) ) {
        if ( $obj->has_column( 'name' ) ) {
            return $obj->name;
        } elseif ( $obj->has_column( 'label' ) ) {
            return $obj->label;
        } elseif ( $obj->has_column( 'title' ) ) {
            return $obj->title;
        }
    }
}
?>