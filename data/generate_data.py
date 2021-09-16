import requests
from bs4 import BeautifulSoup
import json


def prepare_elasticcache_data():
    elasticache_instances = "https://aws.amazon.com/elasticache/pricing/"
    elasticache_obj = requests.get(elasticache_instances)
    soup = BeautifulSoup(elasticache_obj.text, 'html.parser')
    elasticache_tables = soup.find("table")

    elasticache_data = {}
    for row in elasticache_tables.find_all("tr"):
        cells = row.find_all("td")
        if len(cells) < 4 or "vCPU" in str(cells):
            continue
        i_type = cells[0].text
        memory_gb = float(cells[2].text)
        vcpu = int(cells[1].text)
        if i_type not in elasticache_data:
            elasticache_data[i_type] = {
                "memory_gb": memory_gb,
                "vcpu": vcpu
            }
        else:
            if elasticache_data[i_type]["memory_gb"] != memory_gb or elasticache_data[i_type]["vcpu"] != vcpu:
                raise Exception("instance type ahve different memory or cpu")
    with open('data_elasticache.json', 'w') as f:
        json.dump(elasticache_data, f, indent=4, sort_keys=True)

def prepare_search_data():
    search_instances = "https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/es/USD/current/es-ondemand.json"
    search_obj = requests.get(search_instances).json()
    search_data = {}
    for _, region_value in search_obj["regions"].items():
        for _, value in region_value.items():
            if "Instance Type" not in value:
                continue
            i_type = value["Instance Type"]
            memory_gb = float(value["Memory (GiB)"])
            vcpu = int(value["vCPU"])
            if i_type not in search_data:
                search_data[i_type] = {
                    "memory_gb": memory_gb,
                    "vcpu": vcpu
                }
            else:
                if search_data[i_type]["memory_gb"] != memory_gb or search_data[i_type]["vcpu"] != vcpu:
                    raise Exception("instance type ahve different memory or cpu")
    with open('data_search.json', 'w') as f:
        json.dump(search_data, f, indent=4, sort_keys=True)

def prepare_rds_data():
    rds_instances = "https://aws.amazon.com/rds/instance-types/"
    rds_obj = requests.get(rds_instances)
    soup = BeautifulSoup(rds_obj.text, 'html.parser')
    rds_tables = soup.find_all("table")

    rds_data = {}
    for table in rds_tables:
        for row in table.find_all("tr"):
            cells = row.find_all("td")
            if len(cells) < 4 or "vCPU" in str(cells):
                continue
            i_type = cells[0].text
            if "m5d" in i_type or "r5b" in i_type or "r5d" in i_type:
                memory_gb = float(cells[2].text)
                vcpu = int(cells[1].text)
            elif "t2" in i_type or "t3" in i_type:
                memory_gb = float(cells[4].text.replace(",", "."))
                vcpu = int(cells[2].text)
            else:
                memory_gb = float(cells[3].text.replace(",","."))
                vcpu = int(cells[2].text)
            if i_type not in rds_data:
                rds_data[i_type] = {
                    "memory_gb": memory_gb,
                    "vcpu": vcpu
                }
            else:
                if rds_data[i_type]["memory_gb"] != memory_gb or rds_data[i_type]["vcpu"] != vcpu:
                    raise Exception("instance type ahve different memory or cpu")
    with open('data_rds.json', 'w') as f:
        json.dump(rds_data, f, indent=4, sort_keys=True)

prepare_elasticcache_data()
prepare_search_data()
prepare_rds_data()
pass
