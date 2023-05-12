/*** CONTROLLER*/
import prisma from "../lib/prisma";

import path from 'path'
import fileSystem from 'fs'
import createPdf from "../lib/PdfFiles";
export const get = async (req, res) =>
{
    try
    {


        const file = await createPdf('NotedeVenta', 'output')

        res.status(200).json({ pathFile: file });

    } catch (err)
    {
        console.log(err)
        res.status(404).json({ error: err });
    }
};