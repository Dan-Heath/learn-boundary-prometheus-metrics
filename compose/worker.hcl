// compose/worker.hcl

disable_mlock = true

listener "tcp" {
	address = "worker"
	purpose = "proxy"
	tls_disable = true
}

// listener "tcp" {
//   address = "0.0.0.0:9203"
// 	purpose = "ops"
// 	tls_disable = true
// }

worker {
  name = "worker"
  description = "A worker for a docker demo"
  address     = "worker"
  public_addr = "127.0.0.1:9202"
  controllers = ["boundary:9201"]
}

kms "aead" {
  purpose = "worker-auth"
  aead_type = "aes-gcm"
  key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
  key_id = "global_worker-auth"
}
