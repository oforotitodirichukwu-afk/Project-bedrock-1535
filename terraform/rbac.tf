resource "kubernetes_cluster_role_binding_v1" "dev_view" {
 metadata {
 name = "bedrock-dev-view"
 }

 role_ref {
 api_group = "rbac.authorization.k8s.io"
 kind = "ClusterRole"
 name = "view"
 }

 subject {
kind = "User"
 name = aws_iam_user.dev_view.arn
 api_group = "rbac.authorization.k8s.io"
}
}
