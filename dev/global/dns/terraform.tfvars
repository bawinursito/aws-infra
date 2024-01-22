dns_entry = [
    {
        zone_name = "bayu.dev"
        private_zone = false
        tags = {
            env = "dev"
            bu = "bayu"
        }
        dns_records = {
            "www.bayu.dev" = {
                type = "A"
                ttl = 3600
                set_identifier = "asia-www.bayu.dev"
                geolocation_routing_policy = {
                    continent = "AS"
                }
                records = ["203.202.202.1", "203.202.202.2"]  
            },
            "www2.bayu.dev" = {
                type = "CNAME"
                records = ["www.bayu.dev"]
                set_identifier = "indonesia-www.bayu.dev"
                geolocation_routing_policy = {
                    country = "ID"
                }
            },
            "www3.bayu.dev" = {
                type = "A"
                records = ["203.202.202.4", "203.202.202.5"]  
            },
        }
    },
    {
        zone_name = "winursito.dev"
        private_zone = true
        vpc = ["xxxx"]

        tags = {
            env = "development"
            bu = "winursito"
        }
        dns_records = {
            "development.winursito.dev" = {
                type = "A"
                records = ["11.1.1.1"]  
            },
                 "development2.winursito.dev" = {
                type = "A"
                records = ["11.1.1.2"]  
            },
                 "development3.winursito.dev" = {
                type = "A"
                records = ["11.1.1.3"]  
            }
        }
    },


]



