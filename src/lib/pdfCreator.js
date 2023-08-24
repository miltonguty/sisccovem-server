import pdf from "pdf-creator-node"
import fs from "fs"
const pdfCreator = async (inputTemplate, outputPdf, headerTemplate, footerTemplate, datas) => {
    let html = fs.readFileSync(inputTemplate, "utf8");
    let options = {
        format: "A3",
        orientation: "portrait",
        border: "15mm",

        header: {
            height: "30mm",
            contents: {
                1: headerTemplate
            }
        },
        footer: {
            height: "10mm",
            contents: footerTemplate,
            /*contents: {
                first: 'Cover page',
                2: 'Second page', // Any page number is working. 1-based index
                default: footerTemplate, //'<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>', // fallback value
                last: 'Last Page'
            }*/
        }
    };

    let document = {
        html: html,
        data: {
            datas: datas,
        },
        path: outputPdf, //"./output.pdf",
        type: "",
    };
    return await pdf.create(document, options)
}
export default pdfCreator
// Read HTML Template