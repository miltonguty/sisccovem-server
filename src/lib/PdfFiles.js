import pdf from './html-to-pdf'
import fs from 'fs';
const path = require("path");
import { BASE_URL } from '../../config';
const createPdf = async (nameTemplate, nameOutput, datas) =>
{
    console.log(path.resolve(__dirname))
    console.log(__filename)
    pdf.registerPartial('Header', '<header> este es el header</header>');
    pdf.registerPartial('Footer', '<header> este es el Footer</header>');

    var html = fs.readFileSync(path.resolve(__dirname, '../reports/' + nameTemplate + '.html'), 'utf8');
    var options = {
        format: "A3",
        orientation: "portrait",
        border: "10mm"
    };
    var document = {
        type: 'file',     // 'file' or 'buffer'
        template: html,
        context: {
            datas: datas
        },
        path: path.resolve(__dirname, '../reports/' + nameOutput + '.pdf')    // it is not required if type is buffer
    };

    const pdfFile = await pdf.create(document, options)
    console.log(pdfFile)
    return pdfFile


}
export default createPdf;