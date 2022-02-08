// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiClients extends ApiClients {
  _$ApiClients([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiClients;

  @override
  Future<Response<String>> auth(String username, String password) {
    final $url = '';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }
}
