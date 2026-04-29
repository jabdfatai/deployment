job "ai-appointment-demo-tenant-backend" {
  datacenters = ["dc1"]
  type = "service"
  meta = {
    keos_component = "backend"
  }
  task_groups = [
    {
      Name = "backend-group"
      Count = 1
      Tasks = [
        {
          Name = "backend"
          Driver = "docker"
          Config = {
            image = "nginx:alpine"
            ports = ["http"]
          }
          Resources = {
            CPU = 300
            MemoryMB = 256
          }
          Services = [
            {
              Name = "ai-appointment-backend-demo-tenant"
              PortLabel = "http"
            },
          ]
        },
      ]
      Networks = [
        {
          DynamicPorts = [
            {
              Label = "http"
            },
          ]
        },
      ]
    },
  ]
}
