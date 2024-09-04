locals {
  random_suffix = lower(join("", [substr(md5(uuid()), 0, 6)]))
}
