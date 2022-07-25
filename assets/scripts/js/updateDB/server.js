import { PrismaClient } from '@prisma/client'
import express from 'express';
import fetch from "node-fetch";

async function postData(url = '', data = {}) {
  const response = await fetch(url, {
    method: 'POST',
    cache: 'no-cache',
    credentials: 'same-origin',
    headers: {
        'Content-Type': 'application/json'
    },
    redirect: 'follow',
    body: JSON.stringify(data)
    });
    return response.json();
}


const prisma = new PrismaClient()
const app = express();

app.use(express.json())

app.get("/sync", async (req, res) => {
    
    // get date from request
    const date = req.query.date;
    const dateString = date.toString();
    const dateArray = dateString.split("-");
    const year = dateArray[0];
    const month = dateArray[1];
    const day = dateArray[2];
    const dateString2 = year + "-" + month + "-" + day;
    const date2 = new Date(dateString2);


    const wsellhead = await prisma.wsellhead.findMany({
        where: {
            s_date : {
                gte : date2,
                lte : date2
            }
        }
    });
    
    const wselltail = await prisma.wselltail.findMany({
        where: {
            s_code: {
                in: wsellhead.map(wsellhead => wsellhead.s_code)
            }
        }
    });


    const jsonData = {
        wsellhead: wsellhead,
        wselltail: wselltail
    }
    
    const response = await postData('https://anyar.mimoapps.xyz/getupdate.php', jsonData);

    res.send({
        // response : response,
        response
    })
    

});

const server = app.listen(3000, () =>
  console.log('Server running on port 3000')
)