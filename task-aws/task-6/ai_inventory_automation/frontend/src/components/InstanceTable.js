import React, { useEffect, useState } from "react";
import { fetchInstances } from "../services/api";


export default function InstanceTable() {
const [instances, setInstances] = useState([]);


useEffect(() => {
fetchInstances().then(data => setInstances(data));
}, []);


return (
<table border="1">
<thead>
<tr>
<th>Instance ID</th><th>Region</th><th>State</th>
<th>IP</th><th>Scan Method</th><th>Keys Found</th>
<th>EOS Status</th>
</tr>
</thead>
<tbody>
{instances.map(i => (
<tr key={i.id}>
<td>{i.instance_id}</td><td>{i.region}</td><td>{i.state}</td>
<td>{i.ip_address}</td><td>{i.scan_method}</td><td>{i.keys_found}</td>
<td>{i.eos_status}</td>
</tr>
))}
</tbody>
</table>
);
}