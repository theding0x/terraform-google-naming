variable "prefix" {
  description = "The prefix to use for all resources"
  type        = list(string)
  default     = []
}
variable "suffix" {
  description = "The suffix to use for all resources"
  type        = list(string)
  default     = []
}
variable "unique-include-numbers" {
  description = "Whether to include numbers in the unique string"
  type        = bool
  default     = true
}
variable "unique-length" {
  description = "The length of the unique string"
  type        = number
  default     = 8
}
variable "unique-seed" {
  description = "The seed to use for the unique string"
  type        = string
}